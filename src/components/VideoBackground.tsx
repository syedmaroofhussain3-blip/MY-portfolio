import { useRef, useEffect } from 'react';

const VideoBackground = () => {
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    const video = videoRef.current;
    if (!video) return;

    const attemptPlay = async () => {
      try {
        await video.play();
      } catch {
        video.muted = true;
        try {
          await video.play();
        } catch {
          // Autoplay completely blocked
        }
      }
    };

    attemptPlay();
  }, []);

  return (
    <div className="fixed inset-0 z-0 overflow-hidden flex items-center justify-center">
      <video
        ref={videoRef}
        autoPlay
        loop
        muted
        playsInline
        preload="auto"
        className="min-w-full min-h-full object-cover scale-[1.4]"
        style={{ filter: 'brightness(0.65)', objectPosition: 'center center' }}
        src={`${import.meta.env.BASE_URL}videos/hero-bg.mp4`}
      />
      <div className="absolute inset-0 bg-gradient-to-b from-background/30 via-background/20 to-background/60" />
    </div>
  );
};

export default VideoBackground;
