class jk_generator;
    virtual jk_interface intf;
    mailbox #(jk_transaction) gen_to_drv;

    function new(virtual jk_interface intf, mailbox #(jk_transaction) gen_to_drv);
        this.intf = intf;
        this.gen_to_drv = gen_to_drv;
    endfunction

    task run();
        forever begin
            jk_transaction trans = new();
            if (!trans.randomize()) $fatal("Randomization failed!");
            gen_to_drv.put(trans); // Send to driver
            trans.display();
        end
    endtask
endclass
