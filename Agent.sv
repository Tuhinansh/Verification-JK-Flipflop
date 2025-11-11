class jk_agent;
    jk_driver driver;
    jk_monitor monitor;

    function new(virtual jk_if vif);
        driver = new(vif);
        monitor = new(vif);
    endfunction

    task run();
        fork
            driver.run();
            monitor.run();
        join
    endtask
endclass
