require 'spec_helper'

describe 'minecraft::default' do
  context 'install minecraft defaults' do
    let(:vanilla_run) do
      ChefSpec::Runner.new(:platform => 'debian', :version  => '7.0') do |node|
        node.set['minecraft']['install_type'] = 'vanilla'
        node.automatic['memory']['total'] = '2097152kB'
      end.converge(described_recipe)
    end

    context 'Should not render bukkit specific templates' do
      it 'should not render bukkit.yml template' do
        expect(vanilla_run).to_not render_file('/srv/minecraft/bukkit.yml')
      end

      it 'should not render commands.yml template' do
        expect(vanilla_run).to_not render_file('/srv/minecraft/commands.yml')
      end

      it 'should not render help.yml template' do
        expect(vanilla_run).to_not render_file('/srv/minecraft/help.yml')
      end

      it 'should not render permissions.yml template' do
        expect(vanilla_run).to_not render_file('/srv/minecraft/permissions.yml')
      end
    end
  end
end
