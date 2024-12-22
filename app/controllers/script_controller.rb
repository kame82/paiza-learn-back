class ScriptController < ApplicationController
  def execute
    # language = params[:language]
    code = params[:code]
    result = execute_ruby

    render json: { output: result }

  end

  private
  # DockerコンテナでRubyコードを実行する
  def execute_ruby
    return puts "execute_ruby"
  end
end
