import React from 'react';
import { Backdrop, CircularProgress } from '@mui/material';

export const Loader = () => {
  return (
    <Backdrop
      open={true}
      sx={{ color: '#fff', zIndex: (theme) => theme.zIndex.drawer + 1 }}
    >
      <CircularProgress color="inherit"/>
    </Backdrop>
  );
};
