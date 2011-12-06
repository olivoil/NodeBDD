require 'aruba/cucumber'

module CucumberMappings
  def scenario_with_steps(scenario_name, steps)
      write_file("#{features_dir}/a_feature.feature", <<-EOF)
Feature: A feature
  Scenario: #{scenario_name}
#{steps.gsub(/^/, '    ')}
EOF
  end

  def write_feature(feature)
    write_file("#{features_dir}/a_feature.feature", feature)
  end

  def assert_skipped(pattern)
    if pattern_exists?(pattern)
      raise "#{pattern} was not skipped"
    end
  end

  def assert_passed(pattern)
    unless pattern_exists?(pattern)
      raise "#{pattern} did not pass"
    end
  end

  def step_file(pattern)
    pattern.gsub(/ /, '_') + '.step'
  end

  def pattern_exists?(pattern)
    File.exist?(File.join(current_dir, step_file(pattern)))
  end

  protected

  def indent_code(code, levels = 1)
    indented = ''
    code.each_line { |line| indented += "#{'  ' * levels}#{line}" }
    indented
  end
end
