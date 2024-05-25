        export XCARCHIVE_SIM=Maps.framework-iphonesimulator.xcarchive
        export XCARCHIVE_IPHONE=Maps.framework-iphoneos.xcarchive

        echo "Creating archive for an iOS Simulator"
        xcodebuild archive -project GoogleMapsUtils.xcodeproj -scheme GoogleMapsUtils -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath $XCARCHIVE_SIM SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

        echo "Creating archive for an iOS Device"
        xcodebuild archive -project GoogleMapsUtils.xcodeproj -scheme GoogleMapsUtils -configuration Release -destination 'generic/platform=iOS' -archivePath $XCARCHIVE_IPHONE SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

        export ARCH_IPHONE_SIM=$(lipo -archs ${XCARCHIVE_SIM}/Products/Library/Frameworks/GoogleMapsUtils.framework/GoogleMapsUtils)
        echo "Architecture for iPhone Simulator '$ARCH_IPHONE_SIM''"

        export ARCH_IPHONE=$(lipo -archs ${XCARCHIVE_IPHONE}/Products/Library/Frameworks/GoogleMapsUtils.framework/GoogleMapsUtils)
        echo "Architecture for iPhone '$ARCH_IPHONE''"

        echo "Creating XCFramework"
        xcodebuild -create-xcframework -framework ./Maps.framework-iphoneos.xcarchive/Products/Library/Frameworks/GoogleMapsUtils.framework -framework ./Maps.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/GoogleMapsUtils.framework -output ./GoogleMapsUtils.xcframework
        zip -r ./GoogleMapsUtils.xcframework.zip ./GoogleMapsUtils.xcframework

