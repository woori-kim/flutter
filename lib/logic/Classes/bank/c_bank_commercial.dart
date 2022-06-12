import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/bank/c_bank.dart';
import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/Classes/mixin/mixin_interestlisten.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account_loan.dart';
import 'package:flutter_application_1/logic/DataStructure/d_bankclient.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:flutter_application_1/logic/Enum/e_interesttype.dart';
import 'package:flutter_application_1/logic/Enum/e_loantype.dart';
import 'package:flutter_application_1/logic/Enum/e_reservedtag.dart';
import 'package:flutter_application_1/logic/interface/i_bankservice.dart';
import 'package:flutter_application_1/logic/interface/i_interestuser.dart';

class CBCommercial extends CBank
    with InterestListen
    implements IBankService, IInterestClient {
  final HashSet<DBankClient> _clientSet = HashSet();
  double _spreadInterestRate = 2.0;

  CBCommercial(super.belong, super.name) {
    interestListen(this);

    DAccount mainAccount = DAccount(this, EAccountType.deposit, this);
    assetSet.add(mainAccount);
    propertyMap[ETag.mainaccount] = mainAccount;
  }

  @override
  void dayChange(DTime newTime) {
    //금일 이자 계산
    double todayInterest =
        belong.centralBank.baseInterestRate + _spreadInterestRate;
    for (var client in _clientSet) {
      for (var account in client.accounts) {
        if (account.type == EAccountType.loan) {
          DLoanAccount loanaccount = account as DLoanAccount;
          if (loanaccount.repaymentDay == newTime.day) {
            if (loanaccount.loanType == ELoanType.levelpayment) {
              if (loanaccount.repaymentPlan.isEmpty) {
                //상환완료 계좌
                continue;
              }
              //빼가고
              BigInt oldestPlan = loanaccount.repaymentPlan.removeAt(0);
              BigInt interest = BigInt.from(
                  loanaccount.repaymentDuty.toDouble() *
                      (todayInterest / 100) /
                      12);
              BigInt thisround = oldestPlan + interest;
              print('원금 $oldestPlan , 이자 $interest 지급');
              //todayinterest %니까 /100해줘야됨
              loanaccount.subBalance(thisround);
              print('loanaccount balance = ${loanaccount.balance}');
            }
          }
        }
      }
    }
  }

  @override
  DAccount makeNewAccount(CObject newclient, EAccountType type) {
    late DAccount newAccount;
    switch (type) {
      case EAccountType.deposit:
        newAccount = DAccount(newclient, type, this);
        break;
      case EAccountType.loan:
        newAccount = DLoanAccount(newclient, type, this);
        break;
      case EAccountType.saving:
        break;
      case EAccountType.minus:
        break;
      default:
        newAccount = DAccount(newclient, type, this);
    }

    newclient.assetSet.add(newAccount);
    //client안에 있으면 addnewaccount
    for (var client in _clientSet) {
      if (client.client.id == newclient.id) {
        client.accounts.add(newAccount);
        return newAccount;
      }
    }

    //없으면 newclient + addnewaccount
    DBankClient newClient = DBankClient(newclient);
    newClient.accounts.add(newAccount);
    _clientSet.add(newClient);
    return newAccount;
  }

  @override
  bool sendMoney(DAccount source, DAccount destination, BigInt won) {
    //[todo]이 은행 멤버인지 아닌지 확인을 통해서 수수료 책정
    if (source.balance < won) {
      //[todo] error
      return false;
    } else {
      source.subBalance(won); //[todo] = subbalance 도 addbalance처럼 가능?
      //source.subbalance(fee);//수수료 to 은행한테
      destination.addBalance = won;
    }

    return true;
  }

  @override
  void raiseLoan(DLoanAccount loanAccount, BigInt amount, int loanMonth,
      int repaymentDay, ELoanType loanType, EInterestType interestType) {
    if (loanAccount.bank != this) {
      //해당은행계좌가 아니므로 대출 불가
      return;
    }
    final DAccount mainaccount = propertyMap[ETag.mainaccount] as DAccount;
    if (mainaccount.balance < amount) {
      //은행잔액부족으로 대출불가
      return;
    }

    //[todo] if 빌려주는 amount를 은행 잔고의 지급준비율을 제외한 한도내에서 빌려줘야한다.
    loanAccount.addBalance = amount;
    print('대출받음 - ${loanAccount.balance.toString()}');
    double todayInterest =
        belong.centralBank.baseInterestRate + _spreadInterestRate;
    loanAccount.setLoanData(
        loanMonth, amount, repaymentDay, loanType, interestType, todayInterest);
  }

  @override
  void interestChange(double newinterestrate) {
    //_baseInterestRate = newinterestrate;
    //[todo]잘못만든거 같다 그냥 필요할때 central에서 가져오면되는데
    //interest부분 지우고 추후에 central변경에 대해서 commercial이 변경되야되는경우가 있을경우가 대비해서 살려두겟음
  }
}
