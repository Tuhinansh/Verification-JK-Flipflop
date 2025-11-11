class jk_env;
    jk_agent agent;

    function new(virtual jk_if vif);
        agent = new(vif);
    endfunction

    task run();
        agent.run();
    endtask
endclass
