resolvers += Resolver.sonatypeRepo("snapshots")

resolvers += Resolver.sonatypeRepo("public")

resolvers += Resolver.sonatypeRepo("releases")

resolvers += Resolver.mavenLocal

addSbtPlugin("org.ensime" % "ensime-sbt" % "0.2.0")
