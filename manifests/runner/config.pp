# Configuration of SonarQube Runner
class sonarqube::runner::config (
  $package_name,
  $version,
  $installroot,
  $jdbc             = {
    url      => 'jdbc:h2:tcp://localhost:9092/sonar',
    username => 'sonar',
    password => 'sonar',
  },
) {
  # Sonar Runner configuration file
  file { "${installroot}/${package_name}-${version}/conf/sonar-runner.properties":
    content => template('sonarqube/sonar-runner.properties.erb'),
    require => Exec['untar'],
  }
}
