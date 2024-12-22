class ScriptController < ApplicationController
  def execute
    # language = params[:language]
    code = params[:code]
    # puts code
    result = execute_ruby

    render json: { output: result }

  end

  private
  # DockerコンテナでRubyコードを実行する
  # def execute_ruby(code)
  def execute_ruby
    # `docker run --rm -v $(pwd):/app ruby:3.3.4 ruby -e "#{code}"`
        # 一時ファイルを作成してコードを実行
        temp_dir = '/tmp/code_execution'
        FileUtils.mkdir_p(temp_dir)

        # 実行するコードをファイルに書き込む
        # File.write("#{temp_dir}/script.rb", code)
        File.write("#{temp_dir}/script.rb", "puts 'hello code'")

        # Dockerコンテナでコードを実行
        `docker run --rm \
          --memory=50m \
          --memory-swap=50m \
          --cpus=0.5 \
          --network none \
          -v #{temp_dir}:/code \
          ruby:3.3.4 \
          timeout 5 ruby /code/script.rb`
  ensure
        # 一時ファイルを削除
        FileUtils.rm_rf(temp_dir)
  end
end
