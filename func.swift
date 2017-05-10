 func addMetaData(image: UIImage) -> NSData?{
    let sourceImage = image.cgImage
    let data = UIImageJPEGRepresentation(image,1)
    guard let source = CGImageSourceCreateWithData(data! as CFData, nil) else {return nil}
    guard let type = CGImageSourceGetType(source) else {return nil}
    let mutableData = NSMutableData(data: data!)
    guard let destination = CGImageDestinationCreateWithData(mutableData, type, 1, nil) else { return nil}

    let path = Bundle.main.url(forResource: "hasInjectGPanoImage", withExtension: "jpg")
    let imageSource = CGImageSourceCreateWithURL(path! as CFURL, nil)
    let imageProperties = CGImageSourceCopyMetadataAtIndex(imageSource!, 0, nil)
    
    let mutableMetadata = CGImageMetadataCreateMutableCopy(imageProperties!)
    CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyTIFFDictionary, kCGImagePropertyTIFFMake, "Make e.g. Ricoh" as CFTypeRef)
    CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyTIFFDictionary, kCGImagePropertyTIFFModel, "Model e.g.Ricoh Theta S" as CFTypeRef)
    
    CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyGPSDictionary, kCGImagePropertyGPSLatitudeRef, "N" as CFTypeRef)
    CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyGPSDictionary, kCGImagePropertyGPSLatitude, "24.282646361029162" as CFTypeRef)
    CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyGPSDictionary, kCGImagePropertyGPSLongitudeRef, "E" as CFTypeRef)
    CGImageMetadataSetValueMatchingImageProperty(mutableMetadata!, kCGImagePropertyGPSDictionary, kCGImagePropertyGPSLongitude, "121.00848124999993" as CFTypeRef)
    
    let finalMetadata:CGImageMetadata = mutableMetadata!
    CGImageDestinationAddImageAndMetadata(destination, sourceImage! , finalMetadata, nil)
    guard CGImageDestinationFinalize(destination)else {return nil}
    return mutableData;
}
