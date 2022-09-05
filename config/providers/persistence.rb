Hanami.app.register_provider :persistence, namespace: true do
  prepare do
    require "sequel"
    require "rom-changeset"
    require "rom/core"
    require "rom/sql"

    ROM::SQL.load_extensions :postgres

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    max_connections = Integer(ENV["WEB_MAX_THREADS"] || 8) # Match config/puma.rb

    rom_config = ROM::Configuration.new(
      :sql,
      target[:settings].database_url,
      max_connections: max_connections,
      extensions: %i[error_sql pg_array pg_json string_agg pg_enum]
    )

    require "sequel_pg"

    rom_config.plugin(:sql, relations: :instrumentation) do |plugin_config|
      plugin_config.notifications = target["notifications"]
    end

    rom_config.plugin(:sql, relations: :auto_restrictions)


    register "config", rom_config
    register "db", rom_config.gateways[:default].connection
  end

  start do
    config = target["persistence.config"]

    config.auto_registration target.root.join("lib/blog_service/persistence"), namespace: "BlogService::Persistence"

    register "rom", ROM.container(config)
  end
end
