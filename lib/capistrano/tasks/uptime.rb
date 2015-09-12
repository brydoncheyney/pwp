desc "Report uptimes"
task :uptime do
  on roles(:web) do |host|
    info "Host #{host} (#{host.roles.to_a.join(', ')}):\t#{capture(:uptime)}"
  end
end
