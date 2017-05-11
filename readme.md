Add GPano and Custom Metadata to Image use Swift 3</br>
</br>
Swifty not support XMP tag yet. So it seem have no way to add GPano information to image.</br>
But!!!!! Finally I got a way!!</br>
first. I still don't know how to make a CGImageMetadata.</br>
So I make a very small image and use https://www.thexifer.net/#geo-tags to inject GPano metadata.</br>
And put it in bundle , load as imageSource.</br>
*IMPORTANT* Don't use UIImage. It will remove all metadata you add!!</br>
</br>
next, change CGImageMetadata into mutableMetadata.</br>
now! You can add matadata string you want e.g.</br>
`CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyTIFFDictionary, kCGImagePropertyTIFFMake, "Make e.g. Ricoh" as CFTypeRef)`</br>
</br>
Hope useful!</br>
