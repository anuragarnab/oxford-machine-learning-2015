require 'nn'

local ReQU = torch.class('nn.ReQU', 'nn.Module')

function ReQU:updateOutput(input)
  -- TODO
  self.output:resizeAs(input):copy(input)
  -- ...something here...
  self.output[self.output:le(0)] = 0
  self.output:cmul(self.output)
    
  return self.output
end

function ReQU:updateGradInput(input, gradOutput)
  -- TODO
  self.gradInput:resizeAs(gradOutput):copy(gradOutput)
  self.gradInput:cmul(input*2)
  self.gradInput[input:le(0)] = 0
  
  return self.gradInput
end

