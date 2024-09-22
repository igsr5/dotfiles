%w(
  wget
  curl
  htop
  make
  jq
  gcc
  direnv
  fzf
  gnu-sed
  fd
).each do |v|
  package v do
    if node[:platform] == 'darwin'
      user node[:user]
    else
      user 'root'
    end
  end
end

if node[:platform] == 'darwin'
  package 'rg'
else
  package 'ripgrep' do
    user 'root'
  end
end
