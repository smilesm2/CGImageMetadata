Add GPano and Custom Metadata to Image use Swift 3</br>
</br>
Swift still not support XMP tag yet. So it seems that we have no way to add GPano information to an image.</br>
But!!!!! Finally I got a tricky way!!</br>

First. I still don't know how to make a CGImageMetadata.</br>
So I made a very small image which has been injected GPano metadata by this tool(https://www.thexifer.net/#geo-tags).</br>
Then put it in the bundle, load it as an imageSource.</br>
*IMPORTANT* Don't use UIImage. The UIImage will remove all metadata you add!!</br>
</br>
Next, change CGImageMetadata into mutableMetadata.</br>
That's all!</br>
You can add matadata string you want e.g.</br>
`CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyTIFFDictionary, kCGImagePropertyTIFFMake, "Make e.g. Ricoh" as CFTypeRef)`</br>
</br>
Hope that useful to you!!</br>
