class jk_driver;
    virtual jk_if vif;   // Virtual interface
    int max_tests;       // Maximum number of test cases
    int test_count;      // Counter for test cases

    // Constructor
    function new(virtual jk_if vif, int max_tests);
        this.vif = vif;
        this.max_tests = max_tests;
        this.test_count = 0;
    endfunction

    // Main task to drive signals
    task run();
        // Reset the test case counter
        test_count = 0;

        // Drive signals until the maximum number of tests is reached
        while (test_count < max_tests) begin
            @(posedge vif.clk); // Wait for the rising edge of the clock

            // Drive J and K values
            vif.J = test_count % 2; // J toggles between 0 and 1
            vif.K = 0;             // K remains constant at 0

            // Debugging display
            $display("Driver: Driving J=%0b, K=%0b | Test %0d of %0d", 
                     vif.J, vif.K, test_count + 1, max_tests);

            // Increment the test counter
            test_count++;
        end
    endtask
endclass
