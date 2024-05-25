        CHECKSUM=$(swift package compute-checksum ./GoogleMapsUtils.xcframework.zip)
        sed -i '' "s/checksum: \"[a-z0-9]*\"/checksum: \"$CHECKSUM\"/g" Package.swift
