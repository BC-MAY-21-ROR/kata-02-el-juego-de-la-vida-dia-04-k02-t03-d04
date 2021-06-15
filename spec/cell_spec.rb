require 'spec_helper'
require_relative '../src/cell'

describe Cell do
  describe '#live!' do
    it 'changes state' do
      expect(Cell.new.live!).to eq(:alive)
    end
  end
  describe '#die!' do
    it 'changes state' do
      expect(Cell.new.die!).to eq(:dead)
    end
  end
end
