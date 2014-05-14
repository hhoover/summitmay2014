require 'spec_helper'

describe 'minecraft::default' do
  context 'install minecraft defaults' do
    let(:spigot_run) do
      ChefSpec::Runner.new(:platform => 'debian', :version  => '7.0') do |node|
        node.set['minecraft']['install_type'] = 'spigot'
        node.automatic['memory']['total'] = '2097152kB'
      end.converge(described_recipe)
    end
    let(:minecraft_jar) { '/srv/minecraft/spigot.jar' }

    it 'includes bukkit recipe' do
      expect(spigot_run).to include_recipe('minecraft::bukkit')
    end

    context 'renders the spigot.yml template' do
      let(:template) { spigot_run.template('/srv/minecraft/bukkit.yml') }

      it 'renders the template' do
        expect(spigot_run).to render_file(template.path).with_content('settings:')
      end

      it 'is owned by mcserver:mcserver' do
        expect(template.owner).to eq('mcserver')
        expect(template.group).to eq('mcserver')
      end

      it 'has 0644 permissions' do
        expect(template.mode).to eq(0644)
      end
    end
  end
end
