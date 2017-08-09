if Rails::VERSION::MAJOR == 3

  module ActionDispatch
    class Flash
      def call(env)
        if (session = env['rack.session']) && (flash = session['flash'])

          # Beginning of change!

          if flash.respond_to?(:sweep)
            flash.sweep
          else
            session.delete("flash")
          end

          # End of change!

        end

        @app.call(env)
      ensure
        session    = env['rack.session'] || {}
        flash_hash = env[KEY]

        if flash_hash
          if !flash_hash.empty? || session.key?('flash')
            session["flash"] = flash_hash
            new_hash = flash_hash.dup
          else
            new_hash = flash_hash
          end

          env[KEY] = new_hash
        end

        if session.key?('flash') && session['flash'].empty?
          session.delete('flash')
        end
      end
    end
  end

end
