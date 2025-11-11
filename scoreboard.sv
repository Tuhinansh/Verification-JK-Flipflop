class jk_scoreboard;
    virtual jk_interface intf;
    mailbox #(jk_transaction) drv_to_mon;

    function new(virtual jk_interface intf, mailbox #(jk_transaction) drv_to_mon);
        this.intf = intf;
        this.drv_to_mon = drv_to_mon;
    endfunction

    task run();
        forever begin
            jk_transaction trans;
            drv_to_mon.get(trans); // Get the transaction
            @(posedge intf.clk);
            case ({trans.j, trans.k})
                2'b00: assert(intf.q === intf.q) else $error("Q did not hold state!");
                2'b01: assert(intf.q === 0) else $error("Q reset failed!");
                2'b10: assert(intf.q === 1) else $error("Q set failed!");
                2'b11: assert(intf.q !== intf.q) else $error("Q toggle failed!");
            endcase
        end
    endtask
endclass
