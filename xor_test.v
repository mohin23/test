// xor_gate.v - XOR Gate Module
module xor_gate (
    input wire a,
    input wire b,
    output wire y
);
    assign y = a ^ b;
endmodule

// testbench.v - Testbench for XOR Gate
module testbench;
    reg a, b;
    wire y;

    // Instantiate the XOR gate
    xor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Create a dump file for GTKWave
//        $dumpfile("xor_waveform.vcd");
  //      $dumpvars(0, testbench);

        // Test various input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        // End simulation
    //    $finish;
    end
endmodule

