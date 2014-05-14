require 'spec_helper'

describe 'minecraft::default' do
  context 'install minecraft defaults' do
    let(:bukkit_run) do
      ChefSpec::Runner.new(:platform => 'debian', :version  => '7.0') do |node|
        node.set['minecraft']['install_type'] = 'bukkit'
        node.automatic['memory']['total'] = '2097152kB'
      end.converge(described_recipe)
    end
    let(:minecraft_jar) { '/srv/minecraft/craftbukkit.jar' }

    context 'renders the bukkit.yml template' do
      let(:template) { bukkit_run.template('/srv/minecraft/bukkit.yml') }

      it 'renders the template' do
        expect(bukkit_run).to render_file(template.path).with_content('settings:')
      end

      it 'is owned by mcserver:mcserver' do
        expect(template.owner).to eq('mcserver')
        expect(template.group).to eq('mcserver')
      end

      it 'has 0644 permissions' do
        expect(template.mode).to eq(0644)
      end
    end

    context 'renders the permissions.yml template' do
      let(:template) { bukkit_run.template('/srv/minecraft/permissions.yml') }

      it 'renders the template' do
        expect(bukkit_run).to render_file(template.path)
      end

      it 'is owned by mcserver:mcserver' do
        expect(template.owner).to eq('mcserver')
        expect(template.group).to eq('mcserver')
      end

      it 'has 0644 permissions' do
        expect(template.mode).to eq(0644)
      end
    end

    context 'renders the help.yml template' do
      let(:template) { bukkit_run.template('/srv/minecraft/help.yml') }

      it 'renders the template' do
        expect(bukkit_run).to render_file(template.path)
      end

      it 'is owned by mcserver:mcserver' do
        expect(template.owner).to eq('mcserver')
        expect(template.group).to eq('mcserver')
      end

      it 'has 0644 permissions' do
        expect(template.mode).to eq(0644)
      end
    end

    context 'renders the commands.yml template' do
      let(:template) { bukkit_run.template('/srv/minecraft/commands.yml') }

      it 'renders the template' do
        expect(bukkit_run).to render_file(template.path).with_content('icanhasbukkit:')
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
