describe "dimus-base::default" do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    # allow(File).to receive(:exists?)
    stub_command("which sudo").and_return(0)
    stub_search("users", "groups:dotfiles").and_return([])
    stub_data_bag_item("dimus-base", "config").and_return({})
  end

  it "does include yum" do
    expect(chef_run).to include_recipe "yum"
  end

  it "includes apt" do
    expect(chef_run).to include_recipe "apt"
  end

  it "includes chef-client::config" do
    expect(chef_run).to include_recipe "chef-client::config"
  end

  it "includes chef-client::service" do
    expect(chef_run).to include_recipe "chef-client::service"
  end

  it "includes git" do
    expect(chef_run).to include_recipe "git"
  end

  it "includes vim" do
    expect(chef_run).to include_recipe "vim"
  end

  it "includes users" do
    expect(chef_run).to include_recipe "users"
  end

  it "includes sudo" do
    expect(chef_run).to include_recipe "sudo"
  end

  it "includes dimus-base::dotfiles" do
    expect(chef_run).to include_recipe "dimus-base::dotfiles"
  end
end
