import React, { useState } from 'react';
import { Plus } from 'lucide-react';

const EuphoriaGUI = () => {
  const [activeTab, setActiveTab] = useState('general');
  const [isOpen, setIsOpen] = useState(true);

  const tabs = [
    { id: 'general', name: 'General' },
    { id: 'aimbot', name: 'Aimbot' },
    { id: 'esp', name: 'ESP' },
    { id: 'crosshair', name: 'Crosshair' },
    { id: 'settings', name: 'Settings' }
  ];

  // Aimbot Tab State
  const [aimbotSettings, setAimbotSettings] = useState({
    enabled: false,
    wallCheck: false,
    aliveCheck: false,
    teamCheck: false
  });
  const [aimbotDevSettings, setAimbotDevSettings] = useState({
    updateMode: false,
    renderStepped: false
  });
  const [rainbowSpeedAimbot, setRainbowSpeedAimbot] = useState(10);

  // ESP Tab State
  const [espSettings, setEspSettings] = useState({
    enabled: false,
    enableTeamColors: false,
    aliveCheck: false,
    teamCheck: false
  });
  const [espDevSettings, setEspDevSettings] = useState({
    unwrapOnCharacterAbsence: false,
    updateMode: false,
    renderStepped: false
  });
  const [rainbowSpeedESP, setRainbowSpeedESP] = useState(10);
  const [widthBoundary, setWidthBoundary] = useState(15);

  // General Tab State
  const [generalSettings, setGeneralSettings] = useState({
    toggle: false
  });
  const [offsetIncrement, setOffsetIncrement] = useState(15);
  const [animationSensitivity, setAnimationSensitivity] = useState(0);
  const [mousemoveralSensitivity, setMousemoveralSensitivity] = useState(350);
  const [lockMode, setLockMode] = useState('CFrame');
  const [lockPart, setLockPart] = useState('Head');
  const [triggerKey, setTriggerKey] = useState('[MOUSE-2]');

  // Crosshair Tab State
  const [crosshairSettings, setCrosshairSettings] = useState({
    enabled: false,
    visible: false
  });
  const [fieldOfView, setFieldOfView] = useState(90);
  const [sides, setSides] = useState(60);
  const [transparency, setTransparency] = useState(10);
  const [thickness, setThickness] = useState(1);

  // ESP Tab - Additional State
  const [espProperties, setEspProperties] = useState({
    enabled: false,
    displayDistance: false,
    displayDisplayName: false,
    displayHealth: false,
    displayName: false,
    rayTool: false,
    outline: false
  });
  const [fontSizeESP, setFontSizeESP] = useState(12);
  const [offsetESP, setOffsetESP] = useState(10);
  const [transparencyESP, setTransparencyESP] = useState(10);

  // Tracer Properties State
  const [tracerSettings, setTracerSettings] = useState({
    enabled: false,
    outline: false
  });
  const [tracerTransparency, setTracerTransparency] = useState(10);
  const [tracerThickness, setTracerThickness] = useState(1);

  if (!isOpen) return null;

  const TabContent = () => {
    if (activeTab === 'aimbot') {
      return (
        <div className="grid grid-cols-2 gap-4">
          {/* Left Column */}
          <div className="space-y-4">
            {/* Aimbot Settings */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">Aimbot Settings</h3>
              </div>
              <div className="p-3 space-y-2">
                {Object.keys(aimbotSettings).map(key => (
                  <label key={key} className="flex items-center gap-2 cursor-pointer">
                    <input
                      type="checkbox"
                      checked={aimbotSettings[key]}
                      onChange={(e) => setAimbotSettings({...aimbotSettings, [key]: e.target.checked})}
                      className="w-3 h-3 accent-purple-500"
                    />
                    <span className="text-gray-400 text-xs">
                      {key.replace(/([A-Z])/g, ' $1').trim().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                    </span>
                  </label>
                ))}
              </div>
            </div>

            {/* Aimbot Developer Settings */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">Aimbot Developer Settings</h3>
              </div>
              <div className="p-3 space-y-2">
                {Object.keys(aimbotDevSettings).map(key => (
                  <div key={key} className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">
                      {key.replace(/([A-Z])/g, ' $1').trim().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                    </span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                ))}
                <div className="space-y-1">
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">Team Check Option</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs ml-4">TeamColor</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                </div>
                <div className="space-y-1 pt-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Rainbow Speed</span>
                    <span className="text-gray-400 text-xs">{rainbowSpeedAimbot}/30</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="30"
                    value={rainbowSpeedAimbot}
                    onChange={(e) => setRainbowSpeedAimbot(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                  <button className="text-gray-400 text-xs hover:text-white">Refresh</button>
                </div>
              </div>
            </div>
          </div>

          {/* Right Column */}
          <div className="space-y-4">
            {/* ESP Settings */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">ESP Settings</h3>
              </div>
              <div className="p-3 space-y-2">
                {Object.keys(espSettings).map(key => (
                  <label key={key} className="flex items-center gap-2 cursor-pointer">
                    <input
                      type="checkbox"
                      checked={espSettings[key]}
                      onChange={(e) => setEspSettings({...espSettings, [key]: e.target.checked})}
                      className="w-3 h-3 accent-purple-500"
                    />
                    <span className="text-gray-400 text-xs">
                      {key.replace(/([A-Z])/g, ' $1').trim().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                    </span>
                  </label>
                ))}
                <div className="pt-2 space-y-1">
                  <span className="text-gray-400 text-xs">Team Color</span>
                  <div className="w-full h-4 bg-purple-500"></div>
                </div>
              </div>
            </div>

            {/* ESP Developer Settings */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">ESP Developer Settings</h3>
              </div>
              <div className="p-3 space-y-2">
                {Object.keys(espDevSettings).map(key => (
                  <div key={key} className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">
                      {key.replace(/([A-Z])/g, ' $1').trim().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                    </span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                ))}
                <div className="space-y-1">
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">Team Check Option</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs ml-4">TeamColor</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                </div>
                <div className="space-y-1 pt-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Rainbow Speed</span>
                    <span className="text-gray-400 text-xs">{rainbowSpeedESP}/30</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="30"
                    value={rainbowSpeedESP}
                    onChange={(e) => setRainbowSpeedESP(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1 pt-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Width Boundary</span>
                    <span className="text-gray-400 text-xs">{widthBoundary}/30</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="30"
                    value={widthBoundary}
                    onChange={(e) => setWidthBoundary(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                  <button className="text-gray-400 text-xs hover:text-white">Refresh</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      );
    }

    if (activeTab === 'general') {
      return (
        <div className="grid grid-cols-2 gap-4">
          {/* Left Column */}
          <div className="space-y-4">
            {/* Properties */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">Properties</h3>
              </div>
              <div className="p-3 space-y-2">
                <label className="flex items-center gap-2 cursor-pointer">
                  <input
                    type="checkbox"
                    checked={generalSettings.toggle}
                    onChange={(e) => setGeneralSettings({...generalSettings, toggle: e.target.checked})}
                    className="w-3 h-3 accent-purple-500"
                  />
                  <span className="text-gray-400 text-xs">Toggle</span>
                </label>
                <div className="text-gray-400 text-xs">Offset To Move Direction</div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Offset Increment</span>
                    <span className="text-gray-400 text-xs">{offsetIncrement}/30</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="30"
                    value={offsetIncrement}
                    onChange={(e) => setOffsetIncrement(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Animation Sensitivity (ms)</span>
                    <span className="text-gray-400 text-xs">{animationSensitivity}/100</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="100"
                    value={animationSensitivity}
                    onChange={(e) => setAnimationSensitivity(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">mousemoveral Sensitivity</span>
                    <span className="text-gray-400 text-xs">{mousemoveralSensitivity}/500</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="500"
                    value={mousemoveralSensitivity}
                    onChange={(e) => setMousemoveralSensitivity(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">Lock Mode</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs ml-4">CFrame</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                </div>
                <div className="space-y-1">
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">Lock Part</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs ml-4">Head</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                </div>
                <div className="space-y-1">
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">Trigger Key</span>
                    <span className="text-gray-400 text-xs">{triggerKey}</span>
                  </div>
                </div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Username</span>
                  <div className="text-gray-400 text-xs">Blacklist (Ignore) Player</div>
                  <div className="text-gray-400 text-xs">Whitelist Player</div>
                </div>
              </div>
            </div>
          </div>

          {/* Right Column */}
          <div className="space-y-4">
            {/* Field Of View Settings */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">Field Of View Settings</h3>
              </div>
              <div className="p-3 space-y-2">
                <label className="flex items-center gap-2 cursor-pointer">
                  <input
                    type="checkbox"
                    checked={crosshairSettings.enabled}
                    onChange={(e) => setCrosshairSettings({...crosshairSettings, enabled: e.target.checked})}
                    className="w-3 h-3 accent-purple-500"
                  />
                  <span className="text-gray-400 text-xs">Enabled</span>
                </label>
                <div className="text-gray-400 text-xs">Rainbow Color</div>
                <div className="text-gray-400 text-xs">Filled</div>
                <label className="flex items-center gap-2 cursor-pointer">
                  <input
                    type="checkbox"
                    checked={crosshairSettings.visible}
                    onChange={(e) => setCrosshairSettings({...crosshairSettings, visible: e.target.checked})}
                    className="w-3 h-3 accent-purple-500"
                  />
                  <span className="text-gray-400 text-xs">Visible</span>
                </label>
                <div className="text-gray-400 text-xs">Rainbow Outline Color</div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Color</span>
                  <div className="w-full h-4 bg-white"></div>
                </div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Outline Color</span>
                </div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Locked Color</span>
                  <div className="w-full h-4 bg-red-500"></div>
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Field Of View</span>
                    <span className="text-gray-400 text-xs">{fieldOfView}/720</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="720"
                    value={fieldOfView}
                    onChange={(e) => setFieldOfView(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Sides</span>
                    <span className="text-gray-400 text-xs">{sides}/60</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="60"
                    value={sides}
                    onChange={(e) => setSides(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Transparency</span>
                    <span className="text-gray-400 text-xs">{transparency}/10</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="10"
                    value={transparency}
                    onChange={(e) => setTransparency(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Thickness</span>
                    <span className="text-gray-400 text-xs">{thickness}/5</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="5"
                    value={thickness}
                    onChange={(e) => setThickness(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      );
    }

    if (activeTab === 'esp') {
      return (
        <div className="grid grid-cols-2 gap-4">
          {/* Left Column */}
          <div className="space-y-4">
            {/* ESP Properties */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">ESP Properties</h3>
              </div>
              <div className="p-3 space-y-2">
                {Object.keys(espProperties).map(key => (
                  <label key={key} className="flex items-center gap-2 cursor-pointer">
                    <input
                      type="checkbox"
                      checked={espProperties[key]}
                      onChange={(e) => setEspProperties({...espProperties, [key]: e.target.checked})}
                      className="w-3 h-3 accent-purple-500"
                    />
                    <span className="text-gray-400 text-xs">
                      {key.replace(/([A-Z])/g, ' $1').trim().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                    </span>
                  </label>
                ))}
                <div className="text-gray-400 text-xs">Rainbow Outline Color</div>
                <div className="text-gray-400 text-xs">Rainbow Color</div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Color</span>
                  <div className="w-full h-4 bg-white"></div>
                </div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Outline Color</span>
                  <div className="w-full h-4 bg-black"></div>
                </div>
                <div className="space-y-1">
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs">Text Font</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs ml-4">Plex</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Transparency</span>
                    <span className="text-gray-400 text-xs">{transparencyESP}/10</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="10"
                    value={transparencyESP}
                    onChange={(e) => setTransparencyESP(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Font Size</span>
                    <span className="text-gray-400 text-xs">{fontSizeESP}/20</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="20"
                    value={fontSizeESP}
                    onChange={(e) => setFontSizeESP(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Offset</span>
                    <span className="text-gray-400 text-xs">{offsetESP}/30</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="30"
                    value={offsetESP}
                    onChange={(e) => setOffsetESP(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
              </div>
            </div>
          </div>

          {/* Right Column */}
          <div className="space-y-4">
            {/* Tracer Properties */}
            <div className="bg-zinc-900 border border-zinc-700">
              <div className="px-3 py-2 border-b border-zinc-700">
                <h3 className="text-white text-xs">Tracer Properties</h3>
              </div>
              <div className="p-3 space-y-2">
                {Object.keys(tracerSettings).map(key => (
                  <label key={key} className="flex items-center gap-2 cursor-pointer">
                    <input
                      type="checkbox"
                      checked={tracerSettings[key]}
                      onChange={(e) => setTracerSettings({...tracerSettings, [key]: e.target.checked})}
                      className="w-3 h-3 accent-purple-500"
                    />
                    <span className="text-gray-400 text-xs">
                      {key.replace(/([A-Z])/g, ' $1').trim().split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
                    </span>
                  </label>
                ))}
                <div className="text-gray-400 text-xs">Rainbow Outline Color</div>
                <div className="text-gray-400 text-xs">Rainbow Color</div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Color</span>
                  <div className="w-full h-4 bg-white"></div>
                </div>
                <div className="space-y-1">
                  <span className="text-gray-400 text-xs">Position</span>
                  <div className="flex items-center justify-between">
                    <span className="text-gray-400 text-xs ml-4">Bottom</span>
                    <button className="text-gray-400 hover:text-white">
                      <Plus size={12} />
                    </button>
                  </div>
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Transparency</span>
                    <span className="text-gray-400 text-xs">{tracerTransparency}/10</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="10"
                    value={tracerTransparency}
                    onChange={(e) => setTracerTransparency(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
                <div className="space-y-1">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-400 text-xs">Thickness</span>
                    <span className="text-gray-400 text-xs">{tracerThickness}/5</span>
                  </div>
                  <input
                    type="range"
                    min="0"
                    max="5"
                    value={tracerThickness}
                    onChange={(e) => setTracerThickness(e.target.value)}
                    className="w-full h-1 bg-zinc-700 appearance-none cursor-pointer accent-purple-500"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      );
    }

    return (
      <div className="text-center text-gray-500 py-8">
        {activeTab.charAt(0).toUpperCase() + activeTab.slice(1)} content coming soon...
      </div>
    );
  };

  return (
    <div className="fixed inset-0 bg-black/80 flex items-center justify-center p-4 font-mono">
      <div className="bg-zinc-800 shadow-2xl" style={{ width: '600px' }}>
        {/* Title Bar */}
        <div className="bg-zinc-950 px-4 py-2 flex items-center justify-between border-b border-zinc-700">
          <div className="flex items-center gap-2">
            <span className="text-gray-400 text-xs tracking-wider">Euphoria</span>
          </div>
        </div>

        {/* Tab Bar */}
        <div className="bg-zinc-900 border-b border-zinc-700 flex">
          {tabs.map(tab => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`flex-1 px-4 py-2 text-xs transition-colors border-r border-zinc-800 last:border-r-0 ${
                activeTab === tab.id 
                  ? 'bg-zinc-800 text-white' 
                  : 'bg-zinc-900 text-gray-500 hover:text-gray-300'
              }`}
            >
              {tab.name}
            </button>
          ))}
        </div>

        {/* Content Area */}
        <div className="p-4 h-96 overflow-y-auto bg-zinc-950">
          <TabContent />
        </div>
      </div>
    </div>
  );
};

export default EuphoriaGUI;
