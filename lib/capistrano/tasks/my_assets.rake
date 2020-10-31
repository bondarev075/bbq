namespace :my_assets do
  desc 'Precompile assets via webpacker'
  task :local_precompile do
    run_locally do
      with rails_env: fetch(:stage) do
        execute 'yarn install --check-files'
        execute 'bundle exec rake webpacker:compile'
      end
    end
  end
end
