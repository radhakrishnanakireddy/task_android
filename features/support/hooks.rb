Before do
  $driver.start_driver
end

After do |scenario|
  if !File.directory?("screnshots")
    FileUtils.mkdir_p("screnshots")
  end

  time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
  screenshot_name = time_stamp + ".png"
  screenshot_file = File.join("screnshots", screenshot_name)
  $driver.screenshot(screenshot_file)
  embed("#{screenshot_file}", "image/png")
  $driver.driver_quit
end

AfterConfiguration do
  FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end


at_exit do
  ReportBuilder.configure do |config|     
        config.json_path = 'report_android/report.json'
        config.report_path = 'report_android/android_report'
        config.include_images = true
        config.report_types = [:html]
        config.report_tabs = [:overview,:features,:summary,:errors]
        config.report_title = 'TECH TEST RESULTS'
        config.compress_images = true
        time = Time.new
        config.additional_info = { Date: "#{time.strftime("%D Time: %H:%M:%S")}",
                       Platform: "Android 8.1(Nexus 6)",
                       Display_dimensions: '1440x2960, 640dpi',
                       Environment: "app-tech-android-challenge-20180918.apk"
                       }
    end
        ReportBuilder.build_report

end