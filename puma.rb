workers Integer(ENV["PUMA_CONCURRENCY"] || 2)
threads_count = Integer(ENV["PUMA_MAX_THREADS"] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV["PORT"]     || 5000
environment ENV["RACK_ENV"] || "development"
