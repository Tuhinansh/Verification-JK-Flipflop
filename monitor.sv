class jk_monitor;
    virtual jk_if vif;   // Virtual interface
    int max_tests;       // Maximum number of test cases
    int test_count;      // Counter for observed tests

    function new(virtual jk_if vif, int max_tests);
        this.vif = vif;
        this.max_tests = max_tests;
        this.test_count = 0;
    endfunction

    task run();
        string state; // Declare 'state' before the while loop
        while (test_count < max_tests) begin
            @(posedge vif.clk);

            // Determine the state based on J and K
            case ({vif.J, vif.K})
                2'b00: state = "No Change";
                2'b01: state = "Reset";
                2'b10: state = "Set";
                2'b11: state = "Toggle";
                default: state = "Unknown";
            endcase

            // Display the inputs, outputs, and state
            $display("Monitor: J=%0b, K=%0b, Q=%0b, Qn=%0b, State=%s (Test %0d of %0d)", 
                     vif.J, vif.K, vif.Q, vif.Qn, state, test_count + 1, max_tests);

            test_count++;
        end
    endtask
endclass
