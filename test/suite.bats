#!/usr/bin/env bats

@test "jenkins runs ok" {
  run docker run --rm $IMAGE --help
  [ "$status" -eq 0 ]
}

@test "blueocean plugin is installed" {
  run docker run --rm $IMAGE [[ -f /var/jenkins_home/plugins/blueocean.jpi ]]
  [ "$status" -eq 0 ]
}

@test "git plugin is installed" {
  run docker run --rm $IMAGE [[ -f /var/jenkins_home/plugins/git.jpi ]]
  [ "$status" -eq 0 ]
}

@test "job-dsl plugin is installed" {
  run docker run --rm $IMAGE [[ -f /var/jenkins_home/plugins/job-dsl.jpi ]]
  [ "$status" -eq 0 ]
}

@test "ec2 plugin is installed" {
  run docker run --rm $IMAGE [[ -f /var/jenkins_home/plugins/ec2.jpi ]]
  [ "$status" -eq 0 ]
}
