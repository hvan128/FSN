import Button from "@/lib/button";
import React, { useState } from "react";
import AddIcon from "@mui/icons-material/Add";
import SaveIcon from "@mui/icons-material/Save";
import { useDispatch } from "react-redux";
import Typography from "@/lib/typography";
import { httpService } from "@/services/http-service";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeModal } from "@/redux/slice/modalSlice";

const UploadWhiteListBatchFile = ({ refetch }: { refetch: () => void }) => {
  const dispatch = useDispatch();
  const [file, setFile] = useState<File>();
  const handleChangeFile = (e: any) => {
    setFile(e.target.files[0]);
  };
  const uploadFile = async () => {
    try {
      const formData = new FormData();
      formData.append(
        'operations',
        JSON.stringify({
          query:
            'mutation CreateWhiteListBatch($createWhiteListBatchDto:CreateWhiteListBatchDto!){\nCreateWhiteListBatch(createWhiteListBatchDto:$createWhiteListBatchDto) {\nfileName \nid \nfileURL \nstatus}}',
          variables: {
            createWhiteListBatchDto: {
              status: 'IN_PROGRESS',
              fileName: file?.name,
              file: null,
            },
          },
          operationName: 'CreateWhiteListBatch',
        })
      );
      formData.append(
        'map',
        JSON.stringify({
          0: ['variables.createWhiteListBatchDto.file'],
        })
      );
      formData.append('0', file as Blob);
      const body = formData;
      const response = await httpService(body);
      if (!response?.data?.data) {
        dispatch(
          openAlert({
            title: 'UPLOAD BATCH FILE',
            message: response?.data?.errors[0]?.message || "Something was wrong",
            type: 'error',
          })
        );
      } else {
        dispatch(
          openAlert({
            title: 'UPLOAD BATCH FILE',
            message: 'The request is forwarded to checker for approval.',
            type: 'success',
          })
        );
        refetch();
      }
      dispatch(closeModal());
    } catch (error) {
      dispatch(closeModal());
    }
  }

  return (
    <div>
      {/* Content */}
      <div className="bg-white px-5 py-4 sm:p-4 border-b-2 border-b-grey-c100">
        <Button color="primary" startIcon={<AddIcon />} className="mx-5">
          <input
            type="file"
            id="uploadBlackFile"
            multiple
            accept=".xlsm, .xls,.xlsx,.csv"
            className="absolute top-0 left-0 opacity-0 h-full"
            onChange={handleChangeFile}
          />
          Import file
        </Button>
        {file && (
          <>
            <Typography className={"ml-5 pb-3 pt-8 border-b-2 border-b-grey-c100 text-lg text-primary-c700"}>List file: </Typography>
            <Typography className={"ml-5 py-3 border-b-2 border-b-grey-c100 text-lg text-primary-c700"}>{file.name}</Typography>
          </>
        )}
      </div>
      {/* Footer */}
      <div className="flex justify-end px-2 py-4">
        <Button color="primary" endIcon={<SaveIcon />} disabled={!file} onClick={uploadFile}>
          Save
        </Button>
      </div>
    </div>
  );
};

export default UploadWhiteListBatchFile;
