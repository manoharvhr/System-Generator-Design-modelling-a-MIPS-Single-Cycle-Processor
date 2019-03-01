
function ControlUnit_config(this_block)

  % Revision History:
  %
  %   01-Mar-2019  (23:39 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     C:\432\ecte432-project-1\ControlUnit.vhd
  %
  %

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('ControlUnit');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('opcode');

  this_block.addSimulinkOutport('regDst');
  this_block.addSimulinkOutport('jump');
  this_block.addSimulinkOutport('branch');
  this_block.addSimulinkOutport('memRead');
  this_block.addSimulinkOutport('memToReg');
  this_block.addSimulinkOutport('aluOp');
  this_block.addSimulinkOutport('memWrite');
  this_block.addSimulinkOutport('aluSrc');
  this_block.addSimulinkOutport('regWrite');

  regDst_port = this_block.port('regDst');
  regDst_port.setType('UFix_1_0');
  regDst_port.useHDLVector(false);
  jump_port = this_block.port('jump');
  jump_port.setType('UFix_1_0');
  jump_port.useHDLVector(false);
  branch_port = this_block.port('branch');
  branch_port.setType('UFix_1_0');
  branch_port.useHDLVector(false);
  memRead_port = this_block.port('memRead');
  memRead_port.setType('UFix_1_0');
  memRead_port.useHDLVector(false);
  memToReg_port = this_block.port('memToReg');
  memToReg_port.setType('UFix_1_0');
  memToReg_port.useHDLVector(false);
  aluOp_port = this_block.port('aluOp');
  aluOp_port.setType('UFix_2_0');
  memWrite_port = this_block.port('memWrite');
  memWrite_port.setType('UFix_1_0');
  memWrite_port.useHDLVector(false);
  aluSrc_port = this_block.port('aluSrc');
  aluSrc_port.setType('UFix_1_0');
  aluSrc_port.useHDLVector(false);
  regWrite_port = this_block.port('regWrite');
  regWrite_port.setType('UFix_1_0');
  regWrite_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('opcode').width ~= 6);
      this_block.setError('Input data type for port "opcode" must have width=6.');
    end

  end  % if(inputTypesKnown)
  % -----------------------------

  % System Generator found no apparent clock signals in the HDL, assuming combinational logic.
  % -----------------------------
   if (this_block.inputRatesKnown)
     inputRates = this_block.inputRates; 
     uniqueInputRates = unique(inputRates); 
     outputRate = uniqueInputRates(1);
     for i = 2:length(uniqueInputRates)
       if (uniqueInputRates(i) ~= Inf)
         outputRate = gcd(outputRate,uniqueInputRates(i));
       end
     end  % for(i)
     for i = 1:this_block.numSimulinkOutports 
       this_block.outport(i).setRate(outputRate); 
     end  % for(i)
   end  % if(inputRatesKnown)
  % -----------------------------

    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('ControlUnit.vhd');

return;


