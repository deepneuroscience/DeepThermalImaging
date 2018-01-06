 try{

                        if (renderedImage.imageType() == RenderedImage.ImageType.ThermalRadiometricKelvinImage) {
                            double averageTemp = 0;
                            // Youngjun - this is for extracting raw thermal data from the FLIR One thermal imaging device. 
                            // byte ->(little endian)-> short array(16bit)-> ByteBuffer: 8bit+8bit = the value of each thermal pixel.

                            short[] shortPixels = new short[renderedImage.pixelData().length / 2];
                            ByteBuffer buffer=ByteBuffer.wrap(renderedImage.pixelData()).order(ByteOrder.LITTLE_ENDIAN);

                        }
                        
 }
