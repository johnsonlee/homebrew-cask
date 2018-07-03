cask 'shadowsocksx-ng-r8' do
  version '1.4.3-R8-build3'
  sha256 '04b1bc0aa6704cf92f5f06d450e093fe59c40b4a2f3fc69644f7ade1188fa527'

  url "https://github.com/qinyuhang/ShadowsocksX-NG-R/releases/download/#{version}/ShadowsocksX-NG-R8.dmg"
  appcast 'https://github.com/qinyuhang/ShadowsocksX-NG-R/releases.atom'
  name 'ShadowsocksX-NG-R8'
  homepage 'https://github.com/qinyuhang/ShadowsocksX-NG-R/'

  conflicts_with cask: ['shadowsocksx', 'shadowsocksx-ng']
  depends_on macos: '>= :el_capitan'

  app 'ShadowsocksX-NG-R8.app'

  uninstall delete:    '/Library/Application Support/ShadowsocksX-NG',
            launchctl: [
                         'com.qiuyuzhou.shadowsocksX-NG.http',
                         'com.qiuyuzhou.shadowsocksX-NG.kcptun',
                         'com.qiuyuzhou.shadowsocksX-NG.local',
                         'com.qiuyuzhou.ShadowsocksX-NG.LaunchHelper',
                       ],
            quit:      'com.qiuyuzhou.ShadowsocksX-NG',
            script:    {
                         executable: '/Library/Application Support/ShadowsocksX-NG/proxy_conf_helper',
                         args:       ['--mode', 'off'],
                       }

  zap trash: [
               '~/.ShadowsocksX-NG',
               '~/Library/Application Support/ShadowsocksX-NG',
               '~/Library/Caches/com.qiuyuzhou.ShadowsocksX-NG',
               '~/Library/Preferences/com.qiuyuzhou.ShadowsocksX-NG.plist',
             ]
end
