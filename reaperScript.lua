
function CreateFolder(index, name)
  reaper.InsertTrackAtIndex(index, false)
  folder = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(folder, 'P_NAME', name, true)
  reaper.SetMediaTrackInfo_Value( folder, 'I_FOLDERDEPTH',1)
  reaper.SetMediaTrackInfo_Value(folder, 'I_FOLDERCOMPACT', 0)
end

function ImportAudio(index, channel, trackName, fileName, lastInFolder)
  local folderDepth = 0
  if lastInFolder then folderDepth = -1 end

  reaper.SetEditCurPos(0, false, false)
  reaper.InsertTrackAtIndex(index, false)
  tr = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(tr, 'P_NAME', trackName, true)
  reaper.SetMediaTrackInfo_Value( tr, 'I_FOLDERDEPTH',folderDepth)
  reaper.SetOnlyTrackSelected(tr, true)
  reaper.InsertMedia(fileName, 0)
  item = reaper.GetTrackMediaItem(tr, 0)
  take = reaper.GetActiveTake(item)
  reaper.SetMediaItemTakeInfo_Value(take, "I_CHANMODE", channel + 64 + 2)
end

audioFile = "/Users/danielstahl/Documents/Music/Pieces/Module Music/Module Music 7/stage/moduleMusic7Score.caf"

CreateFolder(0, "Low")
ImportAudio(1, 1, "Low reverb", audioFile, false)
ImportAudio(2, 3, "Low clean", audioFile, true)

CreateFolder(3, "Low Bridge")
ImportAudio(4, 5, "Low Bridge reverb", audioFile, false)
ImportAudio(5, 7, "Low Bridge clean", audioFile, true)

CreateFolder(6, "Middle")
ImportAudio(7, 9, "Middle reverb", audioFile, false)
ImportAudio(8, 11, "Middle clean", audioFile, true)

CreateFolder(9, "High")
ImportAudio(10, 13, "High reverb", audioFile, false)
ImportAudio(11, 15, "High clean", audioFile, true)

