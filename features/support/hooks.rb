Before do
  $driver.start_driver
end

After do |scenario|
  begin
    if !File.directory?("screenshots")
      FileUtils.mkdir_p("screenshots")
    end
    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = time_stamp + ".png"
    screenshot_file = File.join("screenshots", screenshot_name)
    $driver.screenshot(screenshot_file)
    embed("#{screenshot_file}", "image/png")
    $driver.driver_quit
  rescue Exception => e
    raise "Not able save sceenshot due to page load error"
  end
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
                       Platform: Config.fetch_device_name[1],
                       Display_dimensions: '1440x2960, 640dpi',
                       Environment: "app-tech-android-challenge-20180918.apk"
                       }
    end
    
    ReportBuilder.build_report
end
