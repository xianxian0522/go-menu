library 'sslib@master'

def jobInfo =   [
  nodeName: "centos7_go_thrift",
  projName: env.SERVER_DIR,
  name: env.PROJECT_NAME_ALAIS,
  deployInput: "no",
   packageInfo: [
        name: env.PROJECT_NAME_ALAIS,
        packageShell: "build_package.sh",
        shellOptions: "${env.BRANCH_NAME} ${env.PROJECT_NAME_ALAIS} ${env.SERVER_DIR}",
        target: "/opt/sumscope/${env.SERVER_DIR}/service",
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
        fileName: "*.spm",
        repoName: "generic-release",
      ]
    ]
  ]
]


building.buildCustomProjectWithSalt(jobInfo)
