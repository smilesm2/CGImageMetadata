Add GPano and Custom Metadata to Image use Swift 3

Swifty not support XMP tag yet. So it seem have no way to add GPano information to image.
But!!!!! Finally I got a way!!
first. I still don't know how to make a CGImageMetadata.
So I make a very small image and use https://www.thexifer.net/#geo-tags to inject GPano metadata.
And put it in bundle , load as imageSource.
*IMPORTANT* Don't use UIImage. It will remove all metadata you add!!

next, change CGImageMetadata into mutableMetadata.
now! You can add matadata string you want e.g.
`CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyTIFFDictionary, kCGImagePropertyTIFFMake, "Make e.g. Ricoh" as CFTypeRef)`

Hope useful!
