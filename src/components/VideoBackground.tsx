const VideoBackground = () => {
  return (
    <div className="fixed inset-0 z-0 overflow-hidden flex items-center justify-center">
      <video
        autoPlay
        loop
        muted
        playsInline
        className="min-w-full min-h-full object-cover scale-[1.3]"
        style={{ filter: 'brightness(0.4)', objectPosition: 'center center' }}
      >
        <source src="/videos/hero-bg.mp4" type="video/mp4" />
      </video>
      <div className="absolute inset-0 bg-gradient-to-b from-background/30 via-background/20 to-background/60" />
    </div>
  );
};

export default VideoBackground;
