# test-script for QUTest unit testing harness
# see https://www.state-machine.com/qtools/qutest.html

# preamble...
proc on_reset {} {
    glb_filter SM
    current_obj SM the_hsm
}

# tests...
test "QHsmTst init"
init
expect "===RTC===> St-Init  Obj=the_hsm,State=QHsm::top->s2"
expect "===RTC===> St-Entry Obj=the_hsm,State=s"
expect "===RTC===> St-Entry Obj=the_hsm,State=s2"
expect "===RTC===> St-Init  Obj=the_hsm,State=s2->s211"
expect "===RTC===> St-Entry Obj=the_hsm,State=s21"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp Init===> Obj=the_hsm,State=s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

#------------------
test "QHsmTst dispatch" -noreset

dispatch A_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=A_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s21"
expect "===RTC===> St-Entry Obj=the_hsm,State=s21"
expect "===RTC===> St-Init  Obj=the_hsm,State=s21->s211"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=A_SIG,State=s21->s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch B_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=B_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=B_SIG,State=s21->s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch D_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=D_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Init  Obj=the_hsm,State=s21->s211"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=D_SIG,State=s211->s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch E_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=E_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s21"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s2"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=E_SIG,State=s->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch I_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=I_SIG,State=s11"
expect "%timestamp =>Intern Obj=the_hsm,Sig=I_SIG,State=s1"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch F_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=F_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s2"
expect "===RTC===> St-Entry Obj=the_hsm,State=s21"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=F_SIG,State=s1->s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch I_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=I_SIG,State=s211"
expect "%timestamp =>Intern Obj=the_hsm,Sig=I_SIG,State=s2"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch I_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=I_SIG,State=s211"
expect "===RTC===> St-Unhnd Obj=the_hsm,Sig=I_SIG,State=s2"
expect "%timestamp =>Intern Obj=the_hsm,Sig=I_SIG,State=s"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch F_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=F_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s21"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s2"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=F_SIG,State=s2->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch A_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=A_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Init  Obj=the_hsm,State=s1->s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=A_SIG,State=s1->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch B_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=B_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=B_SIG,State=s1->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch D_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=D_SIG,State=s11"
expect "===RTC===> St-Unhnd Obj=the_hsm,Sig=D_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Init  Obj=the_hsm,State=s->s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=D_SIG,State=s1->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch D_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=D_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Init  Obj=the_hsm,State=s1->s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=D_SIG,State=s11->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch E_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=E_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=E_SIG,State=s->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch G_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=G_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s2"
expect "===RTC===> St-Entry Obj=the_hsm,State=s21"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=G_SIG,State=s11->s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch H_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=H_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s21"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s2"
expect "===RTC===> St-Init  Obj=the_hsm,State=s->s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=H_SIG,State=s211->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch H_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=H_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Init  Obj=the_hsm,State=s->s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=H_SIG,State=s11->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch C_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=C_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s2"
expect "===RTC===> St-Init  Obj=the_hsm,State=s2->s211"
expect "===RTC===> St-Entry Obj=the_hsm,State=s21"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=C_SIG,State=s1->s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch G_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=G_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s21"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s2"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Init  Obj=the_hsm,State=s1->s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=G_SIG,State=s21->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch C_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=C_SIG,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s11"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s1"
expect "===RTC===> St-Entry Obj=the_hsm,State=s2"
expect "===RTC===> St-Init  Obj=the_hsm,State=s2->s211"
expect "===RTC===> St-Entry Obj=the_hsm,State=s21"
expect "===RTC===> St-Entry Obj=the_hsm,State=s211"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=C_SIG,State=s1->s211"
expect "%timestamp Trg-Done QS_RX_EVENT"

dispatch C_SIG
expect "%timestamp Disp===> Obj=the_hsm,Sig=C_SIG,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s211"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s21"
expect "===RTC===> St-Exit  Obj=the_hsm,State=s2"
expect "===RTC===> St-Entry Obj=the_hsm,State=s1"
expect "===RTC===> St-Init  Obj=the_hsm,State=s1->s11"
expect "===RTC===> St-Entry Obj=the_hsm,State=s11"
expect "%timestamp ===>Tran Obj=the_hsm,Sig=C_SIG,State=s2->s11"
expect "%timestamp Trg-Done QS_RX_EVENT"

# the end
end

