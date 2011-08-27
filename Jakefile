/*
 * Jakefile
 * cappex
 *
 * Created by Patrick Logan on August 27, 2011.
 * Copyright 2011, Patrick Logan All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("cappex", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "cappex.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("cappex");
    task.setIdentifier("com.stardecisions.cappex");
    task.setVersion("1.0");
    task.setAuthor("Patrick Logan");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("cappex");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["cappex"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "cappex", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "cappex", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "cappex"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "cappex"), FILE.join("Build", "Deployment", "cappex")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "cappex"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "cappex"), FILE.join("Build", "Desktop", "cappex", "cappex.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "cappex", "cappex.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "cappex"));
    print("----------------------------");
}
