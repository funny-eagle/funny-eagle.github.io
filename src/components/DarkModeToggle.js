import React from 'react';

import Toggle from './Toggle';
import useDarkMode from 'use-dark-mode';

const DarkModeToggle = () => {
  const darkMode = useDarkMode(false);

  return (
    <div className="dark-mode-toggle">
        <a href="javascript:void(0);" onClick={darkMode.disable}>☀</a>
        <Toggle checked={darkMode.value} onChange={darkMode.toggle} />
        <a href="javascript:void(0)" onClick={darkMode.enable}>☾</a>
    </div>
  );
};

export default DarkModeToggle;
