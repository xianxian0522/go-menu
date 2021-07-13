library 'sslib@master'

def jobInfo =   [
  nodeName: "centos7_go_thrift",
  projName: env.SERVER_DIR,
  name: env.PROJECT_NAME_ALAIS,
  deployInput: "no",
   packageInfo: [
        name: env.PROJECT_NAME_ALAIS,
        packageShell: "build_package.sh",
        shellOptions: "${env.BRANCH_NAME} ${env.PROJECT_NAME_ALAIS} ${env.WEB_NAME} ${env.SERVER_DIR} ${env.BUILD_DEV}",
        target: "/opt/sumscope/${env.SERVER_DIR}/service",
        release: "1",
        archiveFiles: "*.tar.gz"
   ],
   downloadInfo: [ //可选，下载信息，从artifactory下载指定包
        [
             serverName: "artifactory", //可选，artifactory服务器名，jenkins中配置，默认为artifactory
             filePattern: "generic-release/devops/${env.WEB_NAME}/dev/${env.WEB_NAME}.tar.gz", //需下载的文件
             target: "./${env.WEB_NAME}.tar.gz", //下载文件的目标路径，默认为“.”
         ]
   ],
  deployInfo: [
    DEV: [
      saltMasterServer: "172.16.97.147-root",
      targets: [
        [
            targetServer: "172.16.97.194",
            env: "DEV",
        ]
      ]
    ]
  ],
  releaseInfo: [
    serverName: "artifactory",
    packages: [
      [
        fileName: "*.tar.gz",
        repoName: "generic-release",
      ]
    ]
  ]
]


building.buildCustomProject(jobInfo)
