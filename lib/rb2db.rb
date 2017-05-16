require "rb2db/version"

module Rb2db
  def self.pid_check

    # PID file to use.
    pid_file = '/tmp/.rb2db.pid'

    # If the file exists, check if the pid inside is still running
    if (pid = File.file?(pid_file) && File.read(pid_file))
      if pid.to_i > 0 && `ps -p #{pid}`.include?(pid)
        abort "[!] rb2db already running on pid #{pid}"
      end
    end

    # Write new PID file.
    File.write(pid_file, $$)
  end
end
