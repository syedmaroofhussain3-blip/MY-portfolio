const VideoBackground = () => {
  return (
    <div className="fixed inset-0 z-0 overflow-hidden">
      <video
        autoPlay
        loop
        muted
        playsInline
        className="w-full h-full object-cover"
        style={{ filter: 'brightness(0.4)' }}
      >
        <source src="/videos/hero-bg.mp4" type="video/mp4" />
      </video>
      <div className="absolute inset-0 bg-gradient-to-b from-background/30 via-background/20 to-background/60" />
    </div>
  );
};

export default VideoBackground;
