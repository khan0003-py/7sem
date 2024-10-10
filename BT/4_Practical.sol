pragma solidity ^0.8.0;

contract StudentRecords {
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }

    Student[] public students;

    function addStudent(uint256 _id, string memory _name, uint256 _age) public {
        students.push(Student(_id, _name, _age));
    }

    function getStudent(uint256 _index) public view returns (uint256, string memory, uint256) {
        require(_index < students.length, "Student does not exist");
        Student memory student = students[_index];
        return (student.id, student.name, student.age);
    }

    fallback() external payable {
        // Fallback function to receive Ether
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
