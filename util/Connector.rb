# encoding: UTF-8
class Connector
  def self.makeConnect(host_name, db_user, db_pass, db_name)
    begin
      con = Mysql.real_connect(host_name, db_user, db_pass, db_name)
      con.options(Mysql::SET_CHARSET_NAME, 'utf8')
      con.query("SET NAMES utf8")
      con.reconnect = true
    rescue Mysql::Error
      `mysqladmin -u#{db_user} -p#{db_pass} create #{db_name}`
       con = makeConnect
    end
    return con
  end
end
