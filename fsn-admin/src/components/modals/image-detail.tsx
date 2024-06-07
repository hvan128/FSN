'use client';

import * as React from 'react';
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { TransformWrapper, TransformComponent } from "react-zoom-pan-pinch"
import RotateLeftIcon from '@mui/icons-material/RotateLeft';
import RotateRightIcon from '@mui/icons-material/RotateRight';
import FlipIcon from '@mui/icons-material/Flip';
import CloseIcon from '@mui/icons-material/Close';
import ResetIcon from '@mui/icons-material/SettingsBackupRestoreOutlined';
import { Slider, Tooltip } from '@mui/material';
import Button from '../../lib/button';
import Divide from '../../lib/divide';
import Image from 'next/image';
import Typography from '../../lib/typography';
import { closeImageDetail } from '../../redux/slice/imageDetailSlice';
import { RootState } from '../../redux/store';
import { FontFamily, FontSize, TextColor } from '@/enum/setting';


const ImageDetail = () => {
    const imageData = useSelector((state: RootState) => state.imageDetail);
    const dispatch = useDispatch();
    const [rotate, setRotate] = useState(0);
    const [zoom, setZoom] = useState(1);
    const [flip, setFlip] = useState(1);

    const handleClose = () => {
        setTimeout(() => {
            dispatch(closeImageDetail());
            setRotate(0);
            setZoom(1);
            setFlip(1);
        }, 400);
    }

    return (
        <div className={`fixed inset-0 z-50 ${imageData.isOpen ? 'flex items-center justify-center' : 'hidden'}`}
            aria-labelledby="modal-title" role="dialog" aria-modal="true" hidden={!imageData.isOpen}>
            {imageData.isOpen && (
                <>
                    <div className="absolute inset-0 bg-white/40 z-10"></div>
                    <div className={`relative z-50 ${imageData.screen} pointer-events-auto shadow-xl`}>
                        <div className="bg-white rounded-lg overflow-hidden transform transition-all">
                            <div className="sm:overflow-y-auto">
                                <div className="px-4 py-4 sm:p-4 flex items-center justify-between border-b-2 border-b-grey-c100 ">
                                    <Typography
                                        fontSize={FontSize.LG}
                                        fontFamily={FontFamily.BOLD}
                                        textColor={TextColor.PRIMARY_900}
                                    >
                                        {imageData.title}
                                    </Typography>
                                    <CloseIcon onClick={handleClose} className="hover:cursor-pointer" />
                                </div>
                                <div>
                                    <TransformWrapper
                                        initialScale={1}
                                        centerOnInit
                                        zoomAnimation={{ disabled: true }}
                                        doubleClick={{ mode: zoom < 2.5 ? 'zoomIn' : 'zoomOut' }}
                                        onTransformed={(_, { scale }) => {
                                            setZoom(scale);
                                        }}
                                        maxScale={2.5}
                                        minScale={0.5}
                                    >
                                        {({ centerView }) => (
                                            <>
                                                <div
                                                    className='flex grow flex-col justify-center items-center gap-2 md:gap-3 px-2'
                                                >
                                                    <div
                                                        className='flex basis-full w-full overflow-hidden object-contain p-5'
                                                    >
                                                        <TransformComponent wrapperStyle={{ width: '100%' }}>
                                                            {
                                                                imageData.image ? <Image
                                                                    src={imageData.image}
                                                                    alt='card-image'
                                                                    loader={() => imageData.image}
                                                                    width={500}
                                                                    height={500}
                                                                    style={{
                                                                        objectFit: 'contain',
                                                                        height: 500,
                                                                        width: 500,
                                                                        transform: `rotate(${rotate}deg) scaleX(${flip})`,
                                                                    }}
                                                                /> : <Typography fontSize={FontSize.BASE}>No Image</Typography>
                                                            }
                                                        </TransformComponent>

                                                    </div>
                                                </div>
                                                <Divide />
                                                <div className='flex flex-row my-1'>
                                                    <div
                                                        className='flex flex-row justify-center flex-1 my-1 gap-3'
                                                    >
                                                        <div className='flex justify-center items-center xs:basis-1/2 sm:basis-1/12'>
                                                            <Tooltip title="Rotate left">
                                                                <Button
                                                                    className='!min-w-0'
                                                                    onClick={() => {
                                                                        setRotate(prev => prev === -360 ? -90 : prev - 90);
                                                                    }}
                                                                >
                                                                    <RotateLeftIcon />
                                                                </Button>
                                                            </Tooltip>
                                                        </div>
                                                        <div className='flex justify-center items-center xs:basis-1/2 sm:basis-1/12'>
                                                            <Tooltip title="Rotate right">
                                                                <Button
                                                                    className='!min-w-0'
                                                                    onClick={() => {
                                                                        setRotate(prev => prev === 360 ? 90 : prev + 90);
                                                                    }}>
                                                                    <RotateRightIcon />
                                                                </Button>
                                                            </Tooltip>
                                                        </div>
                                                        <div className='flex justify-center items-center xs:basis-2/3 sm:basis-1/4 mx-2'>
                                                            <Slider
                                                                sx={{
                                                                    color: '#2D7D9F'
                                                                }}
                                                                value={zoom}
                                                                valueLabelDisplay="auto"
                                                                step={0.01}
                                                                max={5}
                                                                min={0.5}
                                                                valueLabelFormat={(x) => `${(x * 100).toFixed(0)}%`}
                                                                onChange={(_, value) => {
                                                                    imageData?.image && centerView(value as number, 0);
                                                                    !imageData?.image && setZoom(value as number);
                                                                }}
                                                            />
                                                        </div>
                                                        <div className='flex justify-center items-center xs:basis-1/2 sm:basis-1/12'>
                                                            <Tooltip title="Flip">
                                                                <Button
                                                                    className='!min-w-0'
                                                                    onClick={() => setFlip(prev => prev === 1 ? -1 : 1)}
                                                                >
                                                                    <FlipIcon />
                                                                </Button>
                                                            </Tooltip>
                                                        </div>
                                                        <div className='flex justify-center items-center xs:basis-1/2 sm:basis-1/12'>
                                                            <Tooltip title="Reset">
                                                                <Button
                                                                    className='!min-w-0'
                                                                    onClick={() => {
                                                                        setRotate(0);
                                                                        setZoom(1);
                                                                        setFlip(1);
                                                                        centerView(1, 0);
                                                                    }}>
                                                                    <ResetIcon />
                                                                </Button>
                                                            </Tooltip>
                                                        </div>
                                                    </div>
                                                </div>
                                            </>
                                        )}
                                    </TransformWrapper>
                                </div>
                            </div>
                        </div>
                    </div>
                </>
            )}
        </div >
    );
};

export default ImageDetail;