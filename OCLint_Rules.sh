source ~/.bash_profile
cd ${SRCROOT}
export LC_CTYPE=en_US.UTF-8
xcodebuild -workspace oa.xcworkspace -scheme oa clean
xcodebuild -workspace oa.xcworkspace -scheme oa clean build | xcpretty -r json-compilation-database --output compile_commands.json
oclint-json-compilation-database -e Pods -- -report-type xcode -max-priority-3=15000 -max-priority-2=1500 -max-priority-1=100 -disable-rule=UnusedMethodParameter -disable-rule=TooManyMethods -rc NESTED_BLOCK_DEPTH=10 -rc LONG_VARIABLE_NAME=40 -disable-rule=LongClass -disable-rule=ShortVariableName -disable-rule=LongLine -rc MINIMUM_CASES_IN_SWITCH=2 -disable-rule=LongMethod